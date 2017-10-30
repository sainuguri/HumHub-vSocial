<?php

namespace humhub\modules\session;

class Module extends \humhub\components\Module
{
    public $controllerNamespace = 'humhub\modules\session\controllers';

    public $useUniqueSessionNames = true;

    public function init()
    {
        parent::init();

        // custom initialization code goes here
    }
}
