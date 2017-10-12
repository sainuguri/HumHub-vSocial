<?php

namespace humhub\modules\reward\widgets;

use Yii;
use humhub\modules\stream\widgets\StreamViewer;
use humhub\components\Widget;
use humhub\modules\content\components\ContentContainerActiveRecord;

class RewardContent extends Widget
{
    /**
     * @var ContentContainerActiveRecord
     */
    public $contentContainer;

    /**
     * @var boolean
     */
    public $showProfilePostForm = false;

    public function run()
    {
        $query = \humhub\modules\space\models\Membership::getSpaceMembersQuery($this->space);
        $query->limit($this->maxMembers);

        return $this->render('members', ['space' => $this->space, 'maxMembers' => $this->maxMembers, 'users' => $query->all()]);
    }
}
