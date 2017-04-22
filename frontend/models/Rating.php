<?php
namespace frontend\models;
use Yii;
use common\models\User;
/**
 * This is the model class for table "{{%rating}}".
 *
 * @property integer $id
 * @property integer $user_id
 * @property integer $profile_id
 * @property integer $value
 *
 */
class Rating extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%rating}}';
    }
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'profile_id'], 'required'],
            [['user_id', 'profile_id', 'value'], 'integer'],
        ];
    }
    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'user_id' => 'User ID',
            'profile_id' => 'Profile ID',
            'value' => 'Оцените',
        ];
    }
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProfile()
    {
        return $this->hasOne(Profile::className(), ['id' => 'profile_id']);
    }
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }
    public static function getAverageRating($profile_id){
        $var = self::find()->where(['profile_id' => $profile_id])->average('value');
        return substr($var, 0, 3);
    }
}