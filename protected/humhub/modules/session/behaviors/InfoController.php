<?php

namespace humhub\modules\session\behaviors;

use Yii;
use yii\base\Behavior;


use humhub\modules\session\models\Session;
use yii\web\HttpException;
use humhub\components\Controller;

class InfoController extends Behavior
{

    public $session = null;

    public function events()
    {
        return [
            Controller::EVENT_BEFORE_ACTION => 'beforeAction'
        ];
    }

    /**
     * Returns the current selected session by parameter guid
     *
     * If session doesnt exists or there a no permissions and exception
     * will thrown.
     *
     * @return Session
     * @throws HttpException
     */
    public function getSession()
    {
        if ($this->session != null) {
            return $this->session;
        }

        // Get session GUID by parameter
        $guid = Yii::$app->request->get('sessionguid');

        // Try Load the session
        $this->session = Session::findOne([
            'guid' => $guid
        ]);
        if ($this->session == null)
            throw new HttpException(404, Yii::t('SessionModule.behaviors_InfoControllerBehavior', 'Session not found!'));

        $this->checkAccess();
        return $this->session;
    }

    public function checkAccess()
    {
        if (Yii::$app->getModule('user')->settings->get('auth.allowGuestAccess') && Yii::$app->user->isGuest && $this->space->visibility != Space::VISIBILITY_ALL) {
            throw new HttpException(401, Yii::t('SpaceModule.behaviors_SpaceControllerBehavior', 'You need to login to view contents of this space!'));
        }

        // Save users last action on this session
        // $membership = $this->session->getMembership(Yii::$app->user->id);
        // if ($membership != null) {
        //     $membership->updateLastVisit();
        // } else {

        //     // Super Admin can always enter
        //     if (! Yii::$app->user->isAdmin()) {
        //         // Space invisible?
        //         if ($this->space->visibility == Space::VISIBILITY_NONE) {
        //             // Not Space Member
        //             throw new HttpException(404, Yii::t('SpaceModule.behaviors_SpaceControllerBehavior', 'Space is invisible!'));
        //         }
        //     }
        // }
    }

    public function beforeAction($action)
    {
        $this->owner->prependPageTitle($this->session->session_name);
    }
}

?>
