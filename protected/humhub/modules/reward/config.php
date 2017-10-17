<?php

return [
    'id' => 'reward',
    'class' => \humhub\modules\reward\Module::className(),
    'isCoreModule' => true,
    'events' => array(
        array('class' => \humhub\widgets\TopMenu::className(), 'event' => \humhub\widgets\TopMenu::EVENT_INIT, 'callback' => array('\humhub\modules\reward\Events', 'onTopMenuInit')),
    ),
    'urlManagerRules' => [
        'reward' => 'reward/reward'
    ]
];
?>