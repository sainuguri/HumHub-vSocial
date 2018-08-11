<?php


namespace humhub\modules\session\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use humhub\modules\user\models\User;
use humhub\modules\session\models\Session;
use humhub\modules\session\models\SessionMembership;

class SessionSearch extends Session
{

    public function rules()
    {
        $rules = [
            ['id', 'integer'],
            [['start_day', 'end_day'], 'safe'],
            [['start_time','session_name'], 'string', 'max' => 50],
            [['end_time', 'instructor_name'], 'string', 'max' => 45],
            [['url'], 'unique', 'skipOnEmpty' => 'true']
        ];

        return $rules;
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {

        $user = User::findOne(['id' => Yii::$app->user->id]);
        $role = $user->getRoleName();

//        if ($role == 'Teacher')
  //      {
            $query = Session::find()->where(['instructor_name'=>Yii::$app->user->getIdentity()->displayname]);
    //    }

//        if ($role == 'Student') 
  //      {
    //        $memberships = SessionMembership::find()->select(['session_id'])->where(['user_id' => Yii::$app->user->id]);
//          $query = Session::find()->where(['id'=> $memberships]);
      //  }

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => ['pageSize' => 10]
        ]);

        $dataProvider->setSort([
            'attributes' => [
                'id',
                'session_name',
                'start_day',
                'end_day',
                'start_time',
                'end_time',
                'instructor_name',
            ]
        ]);

        $this->load($params);

        if (!$this->validate()) {
            $query->where('0=1');
            return $dataProvider;
        }
        $query->andFilterWhere(['id' => $this->id]);    
        $query->andFilterWhere(['session_name' => $this->session_name]);
        $query->andFilterWhere(['start_day' => $this->start_day]);
        $query->andFilterWhere(['end_day' => $this->end_day]);
        $query->andFilterWhere(['start_time' => $this->start_time]);
        $query->andFilterWhere(['end_time' => $this->end_time]);
        $query->andFilterWhere(['like', 'instructor_name', $this->instructor_name]);

        return $dataProvider;
    }

}
