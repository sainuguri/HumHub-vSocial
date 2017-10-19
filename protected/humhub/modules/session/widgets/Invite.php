<?php
namespace humhub\modules\session\widgets;

use Yii;

/**
 * Description of InviteModal
 *
 * @author buddha
 */
class Invite extends \yii\base\Widget
{
    public $submitText;
    public $submitAction;
    public $model;
    public $attribute;
    public $searchUrl;
    
    public function run()
    {
        if(!$this->attribute) {
            $this->attribute = 'invite';
        }
        
        return $this->render('invite', [
            'submitText' => $this->submitText,
            'submitAction' => $this->submitAction,
            'model' => $this->model,
            'attribute' => $this->attribute,
            'searchUrl' => $this->searchUrl
        ]);
    }
}
