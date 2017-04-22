<?php
use yii\widgets\DetailView;
use yii\widgets\ActiveForm;
use yii\helpers\Html;
use kartik\helpers\Enum;
use yii\helpers\Url;
?>

<?php $img = $profile->getImage(); ?>

<? echo DetailView::widget([
    'model' => $profile,
    'attributes' => [
        'name',
        'bio',
        [
          'attribute' => 'img',
            'value' => "<img src='{$img->getUrl('200x200')}'>",
            'format' => 'html'
        ],
    ],
]);
?>
<?= 'Средняя оценка: ', $profile->rating; ?>
<?php if(!Yii::$app->user->isGuest && $profile->id !== Yii::$app->user->getId()): ?>
<p>

<?php $form = ActiveForm::begin(); ?>

<?= $form->field($rating, 'value')->dropDownList(
    ['0' => '-','1'=>'1','2'=>'2','3'=>'3','4'=>'4','5'=>'5'],
    [
        'class' => 'form-control visible-lg-inline-block',
        'style' => 'width: 60px;',
    ])
?>

<div class="form-group visible-lg-inline-block">
    <?= Html::submitButton('Оценить', ['class' => 'btn btn-success inline-block']) ?>
</div>

<?php ActiveForm::end(); ?>
</p>
<?php endif; ?>

<p></p>

<?php if(!Yii::$app->user->isGuest) : ?>
    <div class="col-lg-12" style="padding: 0;">

        <h3>Написать комментарий:</h3>

        <?php $form = ActiveForm::begin(); ?>

        <?= $form->field($comment, 'text')->textarea()->label(false); ?>

        <?= Html::hiddenInput('user_id', $comment->user_id); ?>
        <?= Html::hiddenInput('profile_id', $comment->profile_id); ?>

        <div class="form-group visible-lg-inline-block">
            <?= Html::submitButton('Отправить', ['class' => 'btn btn-success inline-block']) ?>
        </div>

        <?php ActiveForm::end(); ?>

    </div>
<? endif; ?>
<p></p>
<div class="col-lg-12" style="padding: 0;">
    <h3> Комментарии: </h3>
<div class="container">
    <?php foreach($comments as $c): ?>
    <div class="row">
        <div class="col-sm-1">
            <div class="thumbnail">
                <img class="img-responsive user-photo" src="<?=$c->getAvatarUrl($c->user_id) ?>">
            </div><!-- /thumbnail -->
        </div><!-- /col-sm-1 -->
        <div class="col-sm-5" style="padding: 0;">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <strong><?=Html::a($c->user->username, \yii\helpers\Url::to(['profile/show?username='.$c->user->username])) ?></strong>
                    <span class="text-muted">commented <?= Enum::timeElapsed($c->created_at); ?></span>
                    <?php if($c->user_id == Yii::$app->user->getId()): ?>
                        <?php $url_delete=Url::toRoute(['comment/delete', 'comment_id' => $c->id, 'user_id' => $c->user_id]); //настройка роутера на нужный урл
                        ?>
                        <a class="btn delete_comment" title="Удалить?" href="<?=$url_delete ?>" data-id="<?=$c->id ?>">
                            <span class="glyphicon glyphicon-remove"></span></a>
                    <?php endif; ?>
                </div>
                <div class="panel-body">
                    <?= $c->text ?>
                </div><!-- /panel-body -->
            </div><!-- /panel panel-default -->
        </div><!-- /col-sm-5 -->
    </div><!-- /row -->
    <?php endforeach; ?>
</div><!-- /container -->