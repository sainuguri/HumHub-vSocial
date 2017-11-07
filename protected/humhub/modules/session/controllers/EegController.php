<?php

/**
 * @link https://www.humhub.org/
 * @copyright Copyright (c) 2017 HumHub GmbH & Co. KG
 * @license https://www.humhub.com/licences
 */

namespace humhub\modules\session\controllers;

use Yii;
use humhub\modules\admin\components\Controller;


/**
 * SpaceController provides global space administration.
 *
 * @since 0.5
 */
class EegController extends Controller
{

    /**
     * @inheritdoc
     */
    public $adminOnly = false;

    /**
     * @inheritdoc
     */
    public function init()
    {
        // $this->subLayout = '@humhub/modules/session/views/info/_layout';
        $this->appendPageTitle(Yii::t('AdminModule.base', 'EEG Data'));

        return parent::init();
    }

    public function actionIndex()
    {
        return $this->render('index');
    }

}
