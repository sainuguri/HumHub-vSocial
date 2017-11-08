<?php

namespace humhub\modules\session\widgets;

use Yii;

use humhub\modules\content\components\ContentContainerController;
use humhub\modules\session\models\Session;

/**
 * The Main Navigation for a space. It includes the Modules the Stream
 *
 * @author Luke
 * @package humhub.modules_core.space.widgets
 * @since 0.5
 */
class Menu extends \humhub\widgets\BaseMenu
{
    /** @var Space */
    public $session;
    public $template = "@humhub/widgets/views/leftNavigation";

    public function init()
    {
        if ($this->session === null && Yii::$app->controller instanceof ContentContainerController && Yii::$app->controller->contentContainer instanceof Session) {
            $this->session = Yii::$app->controller->contentContainer;
        }

        if ($this->session === null) {
            throw new \yii\base\Exception("Could not instance session menu without session!");
        }

        $this->addItemGroup(array(
            'id' => 'modules',
            'label' => Yii::t('SessionModule.widgets_SessionMenuWidget', '<strong>Session</strong> menu'),
            'sortOrder' => 100,
        ));

        $this->addItem(array(
            'label' => Yii::t('SessionModule.widgets_SessionMenuWidget', 'Session Info'),
            'group' => 'modules',
            'url' => $this->session->createUrl('/session/info'),
            'icon' => '<i class="fa fa-bars"></i>',
            'sortOrder' => 100,
            'isActive' => (Yii::$app->controller->id == "info" && (Yii::$app->controller->action->id == "index" || Yii::$app->controller->action->id == 'home') && Yii::$app->controller->module->id == "session"),
        ));

        $this->addItem(array(
            'label' => Yii::t('SessionModule.widgets_SessionMenuWidget', 'EEG Data'),
            'group' => 'modules',
            'url' => $this->session->createUrl('/session/eeg'),
            'icon' => '<i class="fa fa-line-chart"></i>',
            'sortOrder' => 100,
            'isActive' => (Yii::$app->controller->id == "eeg" && (Yii::$app->controller->action->id == "index" || Yii::$app->controller->action->id == 'home') && Yii::$app->controller->module->id == "session")
        ));

        parent::init();
    }

    /**
     * Searches for urls of modules which are activated for the current space
     * and offer an own site over the space menu.
     * The urls are associated with a module label.
     * 
     * Returns an array of urls with associated module labes for modules 
     * @param type $space
     */
    public static function getAvailablePages()
    {
        //Initialize the space Menu to check which active modules have an own page
        $moduleItems = (new static())->getItems('modules');
        $result = [];
        foreach ($moduleItems as $moduleItem) {
            $result[$moduleItem['url']] = $moduleItem['label'];
        }
        return $result;
    }

    /**
     * Returns space default / homepage
     * 
     * @return string|null the url to redirect or null for default home
     */
    public static function getDefaultPageUrl($session)
    {
        $settings = Yii::$app->getModule('session')->settings;

        $indexUrl = $settings->contentContainer($session)->get('indexUrl');
        if ($indexUrl !== null) {
            $pages = static::getAvailablePages();
            if (isset($pages[$indexUrl])) {
                return $indexUrl;
            } else {
                //Either the module was deactivated or url changed
                $settings->contentContainer($session)->delete('indexUrl');
            }
        }
        return null;
    }

    /**
     * Returns space default / homepage
     * 
     * @return string|null the url to redirect or null for default home
     */
    public static function getGuestsDefaultPageUrl($session)
    {
        $settings = Yii::$app->getModule('session')->settings;

        $indexUrl = $settings->contentContainer($session)->get('indexGuestUrl');
        if ($indexUrl !== null) {
            $pages = static::getAvailablePages();
            if (isset($pages[$indexUrl])) {
                return $indexUrl;
            } else {
                //Either the module was deactivated or url changed
                $settings->contentContainer($session)->delete('indexGuestUrl');
            }
        }
        return null;
    }

}

?>
