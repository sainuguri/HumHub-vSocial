<?php
/**
 * @var \humhub\modules\user\models\User $contentContainer
 * @var bool $showProfilePostForm
 */

use yii\helpers\Url;
use yii\helpers\Html;
use humhub\modules\space\models\Space;
use humhub\modules\admin\widgets\SpaceGridView;
?>

                <?php
                    echo SpaceGridView::widget([
                        'dataProvider' => $dataProvider,
                        'filterModel' => $searchModel,
                        'columns' => [
                            [
                                'attribute' => 'id',
                                'options' => ['width' => '40px'],
                                'format' => 'raw',
                                'value' => function($data) {
                                    return $data->id;
                                },
                            ],
                            'session_name',
                            'instructor_name',
                            [
                                'header' => Yii::t('AdminModule.views_user_index', 'Actions'),
                                'class' => 'yii\grid\ActionColumn',
                                'options' => ['style' => 'width:80px; min-width:80px;'],
                                'buttons' => [
                                    'view' => function($url, $model) {
                                        return Html::a('<i class="fa fa-eye"></i>', $model->getUrl(), ['class' => 'btn btn-primary btn-xs tt']);
                                    },
                                    'update' => function() {
                                        return;
                                    },
                                    'delete' => function() {
                                        return;
                                    }
                                ],
                            ],
                        ],
                    ]);
                ?>
