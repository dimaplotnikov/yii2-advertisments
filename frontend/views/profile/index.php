<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\Url;
/* @var $this yii\web\View */

$this->title = Yii::t('app', 'Профиль');
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="user-profile">
    <h1><?= Html::encode($this->title) ?></h1>
<?php $img = $model->getImage(); ?>
    <div class="row">
        <?php
        $url_delete=Url::toRoute(['profile/deleteimg', 'profile_id' => $model->id, 'id_img' => $img->id]); //настройка роутера на нужный урл
        ?>
        <div class="col-xs-6 col-md-3">
            <div  class="thumbnail profile_image_form">
                <?php if($img->urlAlias !== 'placeHolder'): ?>
                <a class="btn delete_profile_img" title="Удалить?" href="<?=$url_delete ?>" data-id="<?=$img->id ?>"><span class="glyphicon glyphicon-remove"></span></a>
                <?php endif; ?>
                <?= Html::img($img->getUrl(), ['alt' => ''])?>
            </div>
        </div>
    </div>
    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data', 'id' => 'formName'], 'action' => Url::to('/profile/update')]) ?>
    <?= $form->field($model, 'name') ?>
    <?= $form->field($model, 'bio')->label('Введите информацию о себе')->textarea() ?>
    <?= $form->field($model, 'img')->fileInput()->label('Загрузить аватар') ?>
    <?= Html::submitButton('Сохранить',['class' => 'btn btn-success'])?>
    <?php ActiveForm::end() ?>
</div>

