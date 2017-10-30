<?php

namespace humhub\modules\dashboard\widgets;

use yii\web\HttpException;

class Games extends \yii\base\Widget
{
    /**
     * Runs the activity widget
     */
    public function run()
    {
        return $this->render('games');
    }

}
