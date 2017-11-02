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
use humhub\modules\admin\widgets\SpaceGridView;
?>



<?php
    echo SpaceGridView::widget([
        'dataProvider' => $dataProvider,
        // 'filterModel' => $searchModel,
        'columns' => [
            'user.username',
            'tokens',
            [
                    'header' => Yii::t('AdminModule.views_user_index', 'Actions'),
                    'class' => 'yii\grid\ActionColumn',
                    'options' => ['style' => 'width:80px; min-width:80px;'],
                    'buttons' => [
                        'view' => function($url, $model) {
                            return Html::a('<i class="fa fa-plus"></i>', ['index'],['class' => 'btn btn-success btn-xs tt']);
                        },
                        'update' => function() {
                            return;
                        },
                        'delete' => function($url, $model) {
                            return Html::a('<i class="fa fa-minus"></i>', ['index'], ['class' => 'btn btn-danger btn-xs tt']);
                        }
                    ],
            ],
        ],
    ]);
?>
