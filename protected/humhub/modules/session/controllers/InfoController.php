<?php

namespace humhub\modules\session\controllers;

use Yii;
use humhub\modules\session\models\Session;
use humhub\modules\user\models\User;
use humhub\modules\user\widgets\UserListBox;
use humhub\modules\stream\actions\ContentContainerStream;

class InfoController extends \humhub\modules\content\components\ContentContainerController
{

    /**
     * @inheritdoc
     */
    public $hideSidebar = false;

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'acl' => [
                'class' => \humhub\components\behaviors\AccessControl::className(),
                'guestAllowedActions' => ['index', 'stream'],
            ]
        ];
    }

    /**
     * @inheritdoc
     */
    public function actions()
    {
        return array(
            'stream' => array(
                'class' => ContentContainerStream::className(),
                'contentContainer' => $this->contentContainer
            ),
        );
    }

    /**
     * Generic Start Action for Profile
     */
    public function actionIndex()
    {
        $session = $this->getSession();

        // if (Yii::$app->request->get('tour') || Yii::$app->request->get('contentId')) {
        //     return $this->actionHome();
        // }

        // $defaultPageUrl = \humhub\modules\space\widgets\Menu::getDefaultPageUrl($space);
        // if ($defaultPageUrl != null) {
        //     return $this->redirect($defaultPageUrl);
        // }
        
        return $this->actionHome();
    }

    /**
     * Default space homepage
     * 
     * @return type
     */
    public function actionHome()
    {
        $session = $this->contentContainer;

        return $this->render('home', [
                    'session' => $session
        ]);
    }
   
}

?>
