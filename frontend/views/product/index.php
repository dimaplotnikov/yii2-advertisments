<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\StringHelper;

/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Products';
?>
<div class="product-index">
    <?php if(!Yii::$app->user->isGuest): ?>
    <p>
        <?= Html::a('Create Product', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?php endif; ?>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            [
                'attribute'=>'img',
                'label'=>'Фото',
                'format'=>'html',
                'content' => function($data){
                    $url = $data->getImageUrl();
                    return Html::img($url);
                }
            ],
            'name',
            [
                'attribute' => 'description',
                'contentOptions' => ['style' => 'height:50px;  '],
                'value' => function ($model) {
                    return StringHelper::truncate($model->description, 100);
                }
            ],
            'created_at',
            'price',
            ['class' => 'yii\grid\ActionColumn',
                'buttons' => [
                    //кнопка апдейта
                    'update' => function ($url, $model) {
                        return $model->user_id == Yii::$app->user->id
                            ? Html::a('<span class="glyphicon glyphicon-pencil"></span>', $url, [
                                'title' => Yii::t('app', 'Update'),
                            ])
                            : '';
                    },
                    'delete' => function ($url, $model) {
                        return $model->user_id == Yii::$app->user->id
                            ? Html::a('<span class="glyphicon glyphicon-trash"></span>', $url, [
                                'title' => Yii::t('app', 'Delete'),
                                'data' => [
                                    'confirm' => 'Are you sure you want to delete this item?',
                                    'method' => 'post',
                                ],
                            ])
                            : '';
                    },
                ],
            ],
        ],
    ]); ?>
</div>
