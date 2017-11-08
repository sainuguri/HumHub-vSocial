<?php

namespace humhub\modules\session\controllers;

use Yii;
use humhub\components\Controller;
use humhub\modules\session\models\Session;
use humhub\modules\session\models\SessionMembership;
use humhub\modules\user\models\Instructor;
use humhub\modules\user\models\forms\Registration;
use humhub\modules\admin\permissions\ManageSpaces;
use humhub\modules\admin\permissions\ManageSettings;

class SessionController extends Controller
{
    public function init()
    {
        $this->appendPageTitle(\Yii::t('SessionModule.base', 'Session'));
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
            $searchModel = new \humhub\modules\session\models\SessionSearch();
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

    public function actionAdd()
    {
        $model =  new Session;
        $instructorModel = new Instructor;

        if ($model->load(Yii::$app->request->post()) && $model->validate() && $model->save())
        {
            $this->view->saved();
            $membership = new SessionMembership();
            $membership->session_id = $model->id;
            $membership->user_id = Yii::$app->user->id;
            $membership->status = SessionMembership::STATUS_MEMBER;
            $membership->save();

            //return $this->actionIndex();
            return $this->actionInvite($model);//redirect(array('/session/session/invite'));
        } else
        {
            return $this->renderAjax('add', ['model' => $model, 'instructorModel' => $instructorModel]);
            //return $this->render('add', array('model' => $model, 'instructorModel' => $instructorModel));
        }
    }

    /**
     * Invite user
     */
    public function actionInvite($session = null)
    {
        $session = ($session == null) ? Session::findOne(['id' => Yii::$app->request->get('session_id', "")]) : $session;
        $model = new \humhub\modules\session\models\forms\InviteForm();
        $model->session = $session;

        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            // Invite existing members
            foreach ($model->getInvites() as $user) {
                $session->inviteMember($user->id, Yii::$app->user->id);
            }
            
            //return $this->htmlRedirect($session->getUrl());
            return $this->redirect(['index']);
        }

        return $this->renderAjax('invite', [
                    'model' => $model,
                    'session' => $session
        ]);
    }


    // public function actionHome()
    // {
    //     return $this->render('home');
    // }
}
