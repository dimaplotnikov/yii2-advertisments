<?php
namespace frontend\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use common\models\User;
use frontend\models\Profile;
use yii\web\UploadedFile;
use frontend\models\Rating;
use frontend\models\Comment;

class ProfileController extends Controller
{
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
        ];
    }
    public function actionIndex()
    {
        return $this->render('index', [
            'model' => $this->findModel(),
        ]);
    }


    public function actionShow($username)
    {
        $user = User::find()->where(['username' => $username])->one();
        // Если в гет пропишем несуществующий юзернейм.
        if(!$user)
        {
            return $this->redirect(['index']);
        }
        $profile = Profile::findOne($user);
        // Если пользователь не гость
        if (!Yii::$app->user->isGuest) {
            // ай-ди пользователя, который голосует
            $user_voting_id = Yii::$app->user->identity->getId();
            //Если пользователь смотрит свой профиль, то он может оставлять комментарии под своим профилем,
            //но не может ставить оценку
            if($user->id == Yii::$app->user->getId())
            {
                $comment = $this->commentProfile($user_voting_id,$profile->id);
            }
            else{
                $comment = $this->commentProfile($user_voting_id,$profile->id);
                // Рейтинг - извлечь по айди профиля и пользователя
                $rating = $this->rateProfile($user_voting_id, $profile->id, $profile);
            }
        }

        $comments = new Comment();
        $comments = $comments->find()->with('user')->where(['profile_id' => $profile])->orderBy('created_at DESC')->all();
        return $this->render('show', [
            'profile' => $profile,
            'rating' => $rating,
            'comments' => $comments,
            'comment' => $comment,
        ]);
    }

    public function actionUpdate()
    {
        $post = Yii::$app->request->post();
        $model = $this->findModel();
        if($model->load($post) && $model->save())
        {
            $model->img = UploadedFile::getInstance($model, 'img');
            if($model->img)
            {
                $model->upload();
            }
            Yii::$app->session->setFlash('success', 'Данные обновлены');
        }
        return $this->render('index', [
            'model' => $model,
        ]);
    }

    protected function rateProfile($user, $id, $profile)
    {
        // Если форма была отправлена, иначе пустой массив
        $vote_rating = Yii::$app->request->post();
        if($rating = Rating::find()->where(['user_id' => $user,'profile_id' => $id])->one()){
            if($rating->load($vote_rating)){
                $rating->update();
                $count_avg = Rating::getAverageRating($id);
                $profile->rating = $count_avg;
                $profile->update();
            }
        }else{
            $rating = new Rating();
            $rating->profile_id = $id;
            $rating->user_id = $user;
            if($rating->load($vote_rating)){
                $rating->save();
                $profile->rating = Rating::getAverageRating($id);
                $profile->update();
            }
        }
        return $rating;
    }

    public function actionDeleteimg($profile_id, $id_img)
    {
        $profile = Profile::find()
            ->where(['id' => $profile_id])
            ->one();
        $img = $profile->getImage();
            if($img->id==$id_img){
                $profile->removeImage($img);
            }

        $success=true;
        return json_encode($success);
    }


    private function findModel()
    {
        return Profile::findOne(Yii::$app->user->identity->getId());
    }

    protected function commentProfile($user, $id)
    {
        $comment = new Comment();
        $comment->user_id = $user;
        $comment->profile_id = $id;
        if($comment->load(Yii::$app->request->post())){
            $comment->created_at = time();
            $comment->save();
            $comment->text = null;
        }
        return $comment;
    }

}