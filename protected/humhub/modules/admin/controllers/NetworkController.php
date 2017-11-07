<?php

/**
 * @link https://www.humhub.org/
 * @copyright Copyright (c) 2017 HumHub GmbH & Co. KG
 * @license https://www.humhub.com/licences
 */

namespace humhub\modules\admin\controllers;

use Yii;
use humhub\modules\admin\components\Controller;
use humhub\modules\admin\permissions\ManageSpaces;
use humhub\modules\admin\permissions\ManageSettings;

/**
 * SpaceController provides global space administration.
 *
 * @since 0.5
 */
class NetworkController extends Controller
{

    /**
     * @inheritdoc
     */
    public $adminOnly = false;

    public function init()
    {
        $this->appendPageTitle(Yii::t('AdminModule.base', 'Network Information'));
        $this->subLayout = '@admin/views/layouts/network';

        return parent::init();
    }

    /**
     * Shows all available spaces
     */
    public function actionIndex()
    {
        return $this->render('index');
    }

    /**
     * General Space Settings
     */
    public function actionSettings()
    {
        $form = new \humhub\modules\admin\models\forms\SpaceSettingsForm;
        $form->defaultJoinPolicy = Yii::$app->getModule('space')->settings->get('defaultJoinPolicy');
        $form->defaultVisibility = Yii::$app->getModule('space')->settings->get('defaultVisibility');
        $form->defaultContentVisibility = Yii::$app->getModule('space')->settings->get('defaultContentVisibility');

        if ($form->load(Yii::$app->request->post()) && $form->validate()) {
            Yii::$app->getModule('space')->settings->set('defaultJoinPolicy', $form->defaultJoinPolicy);
            Yii::$app->getModule('space')->settings->set('defaultVisibility', $form->defaultVisibility);
            Yii::$app->getModule('space')->settings->set('defaultContentVisibility', $form->defaultContentVisibility);

            // set flash message
            $this->view->saved();
            return $this->redirect([
                'settings'
            ]);
        }

        return $this->render('settings', [
            'model' => $form]
        );
    }

}
