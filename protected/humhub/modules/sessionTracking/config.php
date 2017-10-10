<?php

return [
    'id' => 'sessionTracking',
    'class' => \humhub\modules\sessionTracking\Module::className(),
    'isCoreModule' => true,
    'events' => array(
        array('class' => \humhub\widgets\TopMenu::className(), 'event' => \humhub\widgets\TopMenu::EVENT_INIT, 'callback' => array('\humhub\modules\sessionTracking\Events', 'onTopMenuInit')),
    ),
    'urlManagerRules' => [
        'sessionTracking' => 'sessionTracking/SessionTracking'
    ]
];
?>