<?php

namespace humhub\modules\session;

use Yii;
use yii\helpers\Url;

use humhub\modules\session\widgets\ShareWidget;

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
            'label' => Yii::t('SessionModule.base', 'Session Tracking'),
            'id' => 'session',
            'icon' => '<i class="fa fa-clock-o"></i>',
            'url' => Url::toRoute('/session/session'),
            'sortOrder' => 100,
            'isActive' => (Yii::$app->controller->module && Yii::$app->controller->module->id == 'session'),
        ));
    }

}
