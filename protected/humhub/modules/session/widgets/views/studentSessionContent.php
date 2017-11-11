<?php
/**
 * @var \humhub\modules\user\models\User $contentContainer
 * @var bool $showProfilePostForm
 */

use yii\helpers\Url;
use yii\helpers\Html;
use \humhub\compat\CHtml;
use yii\widgets\ActiveForm;
use humhub\modules\space\models\Space;
use humhub\modules\session\widgets\SessionContent;
use humhub\modules\admin\widgets\SpaceGridView;
?>

<?php
    echo SpaceGridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            'user.username',
            'pass',
            'strike',
            'tokens'
        ],
    ]);
?>