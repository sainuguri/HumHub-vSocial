<?php

namespace humhub\modules\user\widgets;

use Yii;
use \humhub\widgets\BaseMenu;
use \yii\helpers\Url;

/**
 * AccountMenuWidget as (usally left) navigation on users account options.
 *
 * @package humhub.modules_core.user.widgets
 * @since 0.5
 * @author Luke
 */
class RewardsMenu extends BaseMenu
{

    public $template = "@humhub/widgets/views/leftNavigation";
    public $type = "accountNavigation";

    public function init()
    {

        $controllerAction = Yii::$app->controller->action->id;
        $this->addItemGroup(array(
            'id' => 'account',
            'label' => Yii::t('UserModule.widgets_RewardsMenuWidget', '<strong>Rewards</strong> Menu'),
            'sortOrder' => 100,
        ));

        $this->addItem(array(
            'label' => Yii::t('UserModule.widgets_RewardsMenuWidget', 'Spaces'),
            'id' => 'spaces',
            'icon' => '<i class="fa fa-inbox"></i>',
            'group' => 'account',
            'url' => Url::toRoute('/admin/space'),
            'sortOrder' => 100,
            'isActive' => (Yii::$app->controller->module && Yii::$app->controller->module->id == 'admin' && Yii::$app->controller->id == 'space'),
            'isVisible' => Yii::$app->user->can([
                new \humhub\modules\admin\permissions\ManageSpaces(),
                new \humhub\modules\admin\permissions\ManageSettings(),
            ]),
        ));

        // Only show this page when really user specific modules available
        if (count(Yii::$app->user->getIdentity()->getAvailableModules()) != 0) {
            $this->addItem(array(
                'label' => Yii::t('UserModule.widgets_RewardsMenuWidget', 'Modules'),
                'icon' => '<i class="fa fa-rocket"></i>',
                'group' => 'account',
                'url' => Url::toRoute('//user/account/edit-modules'),
                'sortOrder' => 120,
                'isActive' => (Yii::$app->controller->action->id == "edit-modules"),
            ));
        }

        parent::init();
    }

}

?>
