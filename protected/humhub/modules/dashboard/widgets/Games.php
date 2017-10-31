<?php

namespace humhub\modules\dashboard\widgets;

use yii\web\HttpException;

class Games extends \yii\base\Widget
{
	public $contentContainer;

    /**
     * Path to Stream Action to use
     *
     * @var string
     */
    public $streamAction = '';
    public function run()
    {
        return $this->render('games');
    }

}
