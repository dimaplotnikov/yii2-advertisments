<?php

namespace frontend\models;

use common\models\User;
use Yii;

/**
 * This is the model class for table "profile".
 *
 * @property integer $id
 * @property string $name
 * @property string $bio
 */
class Profile extends \yii\db\ActiveRecord
{
    public $img;
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'profile';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id'], 'integer'],
            [['bio'], 'string'],
            [['name'], 'string', 'max' => 255],
            [['img'], 'file', 'extensions' => 'png, jpg'],
        ];
    }
    public function behaviors()
    {
        return [
            'image' => [
                'class' => 'rico\yii2images\behaviors\ImageBehave',
            ]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Имя',
            'bio' => 'О себе',
            'img' => 'Аватар'
        ];
    }
    public function upload(){
        if($this->validate()){
            $path = 'upload/store/' . $this->img->baseName . '.' . $this->img->extension;
            $this->img->saveAs($path);
            $this->attachImage($path, true);
            @unlink($path);
            return true;
        }else{
            return false;
        }
    }
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'id']);
    }
}
