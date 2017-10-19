<?php

namespace humhub\modules\session\notifications;

use Yii;
use yii\bootstrap\Html;
use humhub\modules\notification\components\BaseNotification;

/**
 * If an user was invited to a workspace, this notification is fired.
 *
 * @since 0.5
 */
class Invite extends BaseNotification
{

    /**
     * @inheritdoc
     */
    public $moduleId = "session";

    /**
     * @inheritdoc
     */
    public $viewName = "invite";

    /**
     * @inheritdoc
     */
    public $markAsSeenOnClick = false;

    /**
     *  @inheritdoc
     */
    public function category()
    {
        return new SessionMemberNotificationCategory;
    }

    /**
     *  @inheritdoc
     */
    public function getSession()
    {
        return $this->source;
    }

    /**
     *  @inheritdoc
     */
    public function getMailSubject()
    {
        return strip_tags($this->html());
    }

    /**
     * @inheritdoc
     */
    public function html()
    {
        return Yii::t('SessionModule.notification', '{displayName} invited you to the session {sessionName}', array(
                    '{displayName}' => Html::tag('strong', Html::encode($this->originator->displayName)),
                    '{sessionName}' => Html::tag('strong', Html::encode($this->getSession()->session_name))
        ));
    }

}

?>
