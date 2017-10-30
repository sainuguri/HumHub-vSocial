<?php

namespace humhub\modules\session\widgets;

use Yii;
use yii\base\Widget;
use humhub\modules\content\models\Content;
use humhub\modules\post\models\Post;

/**
 * This widget will added to the sidebar and show infos about the current selected space
 *
 * @author Andreas Strobel
 * @since 0.5
 */
class Header extends Widget
{

    /**
     * @var \humhub\modules\space\models\Space the Space which this header belongs to
     */
    public $session;

    /**
     * @inheritdoc
     */
    public function run()
    {
        return $this->render('header', [
                    'session' => $this->session
        ]);
    }

}

?>