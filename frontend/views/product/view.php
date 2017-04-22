<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $model frontend\models\Product */

$this->title = $model->name;
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="product-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?php if(Yii::$app->user->getId() == $model->user_id): ?>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>
    <?php endif; ?>
    <?php $img = $model->getImage();
    $gallery = $model->getImages();?>

    <?php if(Yii::$app->user->id == $model->user_id): ?>
     <div class="row">
         <?php
            $url_delete=Url::toRoute(['product/deleteimg', 'product_id' => $model->id, 'id_img' => $img->id]); //настройка роутера на нужный урл
		?>
         <div class="col-xs-6 col-md-3">
		<div  class="thumbnail product_image_form">
        <?php if($img->urlAlias !== 'placeHolder'): ?>
			 <a class="btn delete_product_img" title="Удалить?" href="<?=$url_delete ?>" data-id="<?=$img->id ?>"><span class="glyphicon glyphicon-remove"></span></a>
        <?php endif; ?>
            <a class="fancybox img-rounded" rel="gallery1" href="<?=$img->getUrl() ?>"><?= Html::img($img->getUrl(), ['alt' => ''])?></a>
		</div>
		</div>
         </div>
    <?php else: ?>
        <div class="row">
    <div class="col-xs-6 col-md-3">
        <div  class="thumbnail product_image_form">
            <a class="fancybox img-rounded" rel="gallery1" href="<?=$img->getUrl() ?>"><?= Html::img($img->getUrl(), ['alt' => ''])?></a>
        </div>
    </div>
</div>
    <?php endif; ?>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'name',
            'created_at',
            'price',
            'description',
        ],
    ]) ?>
    <?= DetailView::widget([
        'model' => $user,
        'attributes' => [
            [
                'attribute' => 'username',
                'label' => 'Добавил',
                'value' => Html::a($user->username,Url::to(['/profile/show?username='.$user->username])),
                'format' => 'html'
            ],
        ],
    ]) ?>

</div>
