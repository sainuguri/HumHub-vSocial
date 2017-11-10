<?php

namespace humhub\modules\session\models;

use Yii;
use humhub\modules\user\models\User;
use humhub\modules\session\models\Session;

/**
 * This is the model class for table "session_membership".
 *
 * @property integer $session_id
 * @property integer $user_id
 * @property string $originator_user_id
 * @property integer $status
 * @property integer $show_at_dashboard
 * @property integer $send_notifications
 */
class SessionMembership extends \yii\db\ActiveRecord
{
    /**
     * Status Codes
     */
    const STATUS_INVITED = 1;
    const STATUS_APPLICANT = 2;
    const STATUS_MEMBER = 3;

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'session_membership';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['session_id', 'user_id'], 'required'],
            [['session_id', 'user_id', 'status', 'show_at_dashboard', 'send_notifications'], 'integer'],
            [['originator_user_id'], 'string', 'max' => 45],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'session_id' => 'Session ID',
            'user_id' => 'User ID',
            'originator_user_id' => 'Originator User ID',
            'status' => 'Status',
            'show_at_dashboard' => 'Show At Dashboard',
            'send_notifications' => 'Send Notifications',
        ];
    }

    public function isMember()
    {
        return $this->status == self::STATUS_MEMBER;
    }

    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }

    public function getOriginator()
    {
        return $this->hasOne(User::className(), ['id' => 'originator_user_id']);
    }

    public function getSession()
    {
        return $this->hasOne(Session::className(), ['id' => 'session_id']);
    }

    /**
     * Returns a list of all sessions of the given userId
     *
     * @param type $userId
     */
    public static function GetUserSessions($userId = "")
    {
        if ($userId == "")
            $userId = Yii::$app->user->id;

        $cacheId = "userSessions_" . $userId;

        $sessions = Yii::$app->cache->get($cacheId);
        if ($sessions === false) {

            $orderSetting = Yii::$app->getModule('session')->settings->get('sessionOrder');
            $orderBy = 'session_name ASC';
            if ($orderSetting != 0) {
                $orderBy = 'last_visit DESC';
            }

            $memberships = self::find()->joinWith('session')->where(['user_id' => $userId, 'session_membership.status' => self::STATUS_MEMBER])->orderBy($orderBy);

            $sessions = array();
            foreach ($memberships->all() as $membership) {
                $sessions[] = $membership->session;
            }
            Yii::$app->cache->set($cacheId, $sessions);
        }
        return $sessions;
    }

    public static function getUserSessionQuery(User $user, $memberOnly = true, $withNotifications = null)
    {
        $query = Session::find();
        $query->leftJoin('session_membership', 'session_membership.session_id=session.id and session_membership.user_id=:userId', [':userId' => $user->id]);

        if ($memberOnly) {
            $query->andWhere(['session_membership.status' => self::STATUS_MEMBER]);
        }

        if ($withNotifications === true) {
            $query->andWhere(['session_membership.send_notifications' => 1]);
        } else if ($withNotifications === false) {
            $query->andWhere(['session_membership.send_notifications' => 0]);
        }

        if (Yii::$app->getModule('session')->settings->get('sessionOrder') == 0) {
            $query->orderBy('name ASC');
        } 
        // else {
        //     $query->orderBy('last_visit DESC');
        // }

        $query->orderBy(['name' => SORT_ASC]);

        return $query;
    }

    public static function findByUser(User $user = null, $membershipSatus = self::STATUS_MEMBER, $sessionStatus = Session::STATUS_ENABLED)
    {
        if (!$user) {
            $user = Yii::$app->user->getIdentity();
        }
        
        $query = SessionMembership::find();

        if (Yii::$app->getModule('session')->settings->get('sessionOrder') == 0) {
            $query->orderBy('session.session_name ASC');
        } else {
            $query->orderBy('session_membership.last_visit DESC');
        }

        $query->joinWith('session')->where(['session_membership.user_id' => $user->id]);
        
        if($sessionStatus) {
            $query->andWhere(['session.status' => $sessionStatus]);
        }

        if ($membershipSatus) {
            $query->andWhere(['session_membership.status' => $membershipSatus]);
        }

        return $query;
    }

    public static function getSessionMembersQuery(Session $session)//, $membersOnly = true, $withNotifications = null)
    {
        $query = User::find()->active();
        $query->join('LEFT JOIN', 'session_membership', 'session_membership.user_id=user.id');

        // if ($membersOnly) {
        //     $query->andWhere(['session_membership.status' => self::STATUS_MEMBER]);
        // }

        // if ($withNotifications === true) {
        //     $query->andWhere(['session_membership.send_notifications' => 1]);
        // } else if ($withNotifications === false) {
        //     $query->andWhere(['session_membership.send_notifications' => 0]);
        // }

        $query->andWhere(['session_id' => $session->id])->defaultOrder();
        return $query;
    }
}
