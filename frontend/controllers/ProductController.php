<?php

namespace frontend\controllers;

use common\models\User;
use Yii;
use frontend\models\Product;
use yii\data\ActiveDataProvider;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\UploadedFile;
use frontend\models\Rating;
use frontend\models\Profile;

/**
 * ProductController implements the CRUD actions for Product model.
 */
class ProductController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Lists all Product models.
     * @return mixed
     */
    public function actionIndex()
    {
        $dataProvider = new ActiveDataProvider([
            'query' => Product::find(),
            'sort'=> ['defaultOrder' => ['id' => SORT_DESC]]
        ]);
        $model =  Product::find()->orderBy(['id' => SORT_DESC])->limit(20)->all();
        return $this->render('index', [
            'dataProvider' => $dataProvider,
            'model' => $model
        ]);
    }
    /**
     * Displays a single Product model.
     * @param string $id
     * @return mixed
     */
    public function actionView($id)
    {
        $product = Product::findOne($id);
        $user = User::findOne($product->user_id);
        return $this->render('view', [
            'model' => $this->findModel($id),
            'user' => $user,
        ]);
    }

    /**
     * Creates a new Product model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Product();
        $model->user_id = Yii::$app->user->getId();
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            $model->image = UploadedFile::getInstance($model, 'image');
            if($model->image)
            {
                $model->upload();
            }
            unset($model->image);
            $model->gallery = UploadedFile::getInstances($model, 'gallery');
            $model->uploadGallery();
            Yii::$app->session->setFlash('success',"Товар {$model->name} добавлен");
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }


    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        if ($model->user_id == Yii::$app->user->id){
            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                $model->image = UploadedFile::getInstance($model, 'image');
                if($model->image)
                {
                    $model->upload();
                }
                unset($model->image);
                $model->gallery = UploadedFile::getInstances($model, 'gallery');
                $model->uploadGallery();
                Yii::$app->session->setFlash('success',"Товар {$model->name} обновлен");
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('update', [
                    'model' => $model,
                ]);
            }
        }
        else{
            throw new NotFoundHttpException('Not allowed');
        }
    }

    /**
     * Deletes an existing Product model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param string $id
     * @return mixed
     */
    public function actionDelete($id)
    {
            $this->findModel($id)->delete();
            return $this->redirect(['index']);

    }

    public function actionDeleteimg($product_id, $id_img)
    {
        $model = $this->findModel($product_id);
        if ($model->user_id == Yii::$app->user->id){
            $product = Product::find()
                ->where(['id' => $product_id])
                ->one();
            $img = $product->getImage();
            if($img->id==$id_img){
                $product->removeImage($img);
            }

            $success=true;
            return json_encode($success);
        }
        else{
            throw new NotFoundHttpException('Not allowed');
        }

    }
    /**
     * Finds the Product model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param string $id
     * @return Product the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Product::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
