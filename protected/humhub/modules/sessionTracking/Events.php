<?php

namespace humhub\modules\sessionTracking;

use Yii;
use yii\helpers\Url;

use humhub\modules\reward\widgets\ShareWidget;

/**
 * Description of Events
 *
 * @author sj9t5
 */
class Events
{

    /**
     * On build of the TopMenu, check if module is enabled
     * When enabled add a menu item
     *
     * @param type $event
     */
    public static function onTopMenuInit($event)
    {

        // Is Module enabled on this workspace?
        $event->sender->addItem(array(
            'label' => Yii::t('SessionTrackingModule.base', 'Session Tracking'),
            'id' => 'sessionTracking',
            'icon' => '<i class="fa fa-clock-o "></i>',
            'url' => Url::toRoute('/sessionTracking/sessionTracking'),
            'sortOrder' => 100,
            'isActive' => (Yii::$app->controller->module && Yii::$app->controller->module->id == 'sessionTracking'),
        ));
    }

}
