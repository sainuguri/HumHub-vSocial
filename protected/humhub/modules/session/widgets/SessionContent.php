<?php

namespace humhub\modules\session\widgets;

use Yii;
use humhub\components\Widget;
use yii\data\ActiveDataProvider;
use humhub\modules\user\models\User;
use humhub\modules\session\models\Tokens;
use humhub\modules\session\models\SessionMembership;
use humhub\modules\content\components\ContentContainerActiveRecord;

class SessionContent extends Widget
{
    /**
     * @var string
     */
    public $content = '';

    /**
     * @var ContentContainerActiveRecord
     */
    public $contentContainer;

    public function run()
    {
        $query = \humhub\modules\session\models\Tokens::find()->joinWith('user')->where(['session_id' => $this->contentContainer->id]);
        // $query = \humhub\modules\session\models\SessionMembership::getSessionMembersQuery($this->contentContainer);
        $searchModel = new \humhub\modules\session\models\SessionSearch();
        // $dataProvider =  $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            ]);

        $dataProvider->setSort([
            'attributes' => [
                'user.username',
                'pass',
                'strike',
                'tokens'
            ]
        ]);


        // return $this->content;
        return $this->render('sessionContent', [
                'dataProvider' => $dataProvider,
            ]);
    }

    public function actionUpdate($userID, $tokens)
    {
        var_dump($userID);
        $tokenModel = new Tokens;
        $tokenModel->session_id = 11;
        $tokenModel->user_id = 7;
        $tokenModel->tokens = 3;

        $tokenModel->save();
        // echo 'qwerty';
        return $userID;
    }
}