<?php

namespace humhub\modules\reward\controllers;

use Yii;
use humhub\components\Controller;
use humhub\modules\admin\permissions\ManageSpaces;
use humhub\modules\admin\permissions\ManageSettings;

class RewardController extends Controller
{
    public function init()
    {
        $this->appendPageTitle(\Yii::t('RewardModule.base', 'Reward'));
        return parent::init();
    }

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'acl' => [
                'class' => \humhub\components\behaviors\AccessControl::className(),
                'guestAllowedActions' => [
                    'index',
                    'stream'
                ]
            ]
        ];
    }

    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'stream' => [
                'class' => \humhub\modules\reward\components\actions\RewardStream::className()
            ]
        ];
    }

    /**
     * Dashboard Index
     *
     * Show recent wall entries for this user
     */
    public function actionIndex()
    {
        // if (Yii::$app->user->can(new ManageSpaces())) {
            // $searchModel = new \humhub\modules\admin\models\SpaceSearch();
            $searchModel = new \humhub\modules\reward\models\SpaceSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

            return $this->render('index', [
                'dataProvider' => $dataProvider,
                'searchModel' => $searchModel
            ]);
        // } else if (Yii::$app->user->can(new ManageSettings())) {
        //     $this->redirect([
        //         'settings'
        //     ]);
        // }
    }

}
