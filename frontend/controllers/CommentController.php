<?php
namespace frontend\controllers;
use frontend\models\Comment;
use Yii;
use yii\web\Controller;
use yii\web\NotFoundHttpException;

class CommentController extends Controller
{
    public function actionIndex()
    {
        $var = Yii::$app->request->post();
        return $this->renderFile('@frontend/views/profile/show.php', [
            'variable' => $var,
        ]);
    }

    public function actionDelete($comment_id,$user_id)
    {
        if(Yii::$app->user->getId() == $user_id)
        {
            $comment = Comment::findOne($comment_id);
            $comment->delete();
            $success=true;
            return json_encode($success);
        }
        else{
            throw new NotFoundHttpException('Вы не можете удалять чужие комментарии.');
        }

    }
}