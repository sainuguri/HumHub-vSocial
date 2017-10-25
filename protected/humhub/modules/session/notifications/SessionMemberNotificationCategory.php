<?php

namespace humhub\modules\session\notifications;

use Yii;
use humhub\modules\notification\components\NotificationCategory;
use humhub\modules\notification\targets\BaseTarget;
use humhub\modules\notification\targets\MailTarget;
use humhub\modules\notification\targets\WebTarget;
use humhub\modules\notification\targets\MobileTarget;

/**
 * SessionMemberNotificationCategory
 *
 * @author sj9t5
 */
class SessionMemberNotificationCategory extends NotificationCategory
{

    /**
     * @inheritdoc
     */
    public $id = 'session_member';

    /**
     * @inheritdoc
     */
    public function getTitle()
    {
        return Yii::t('SessionModule.notifications_SessionMemberNotificationCategory', 'Session Membership');
    }

    /**
     * @inheritdoc
     */
    public function getDescription()
    {
        return Yii::t('SessionModule.notifications_SessionMemberNotificationCategory', 'Receive Notifications for Session Invite events.');
    }

    /**
     * @inheritdoc
     */
    public function getDefaultSetting(BaseTarget $target)
    {
        if ($target->id === MailTarget::getId()) {
            return true;
        } else if ($target->id === WebTarget::getId()) {
            return true;
        } else if ($target->id === MobileTarget::getId()) {
            return true;
        }

        return $target->defaultSetting;
    }

}
