<?php

return [
    'id' => 'session',
    'class' => \humhub\modules\session\Module::className(),
    'isCoreModule' => true,
    'events' => array(
        array('class' => \humhub\widgets\TopMenu::className(), 'event' => \humhub\widgets\TopMenu::EVENT_INIT, 'callback' => array('\humhub\modules\session\Events', 'onTopMenuInit')),
    ),
    'urlManagerRules' => [
        'session' => 'session/session'
    ]
];
?>