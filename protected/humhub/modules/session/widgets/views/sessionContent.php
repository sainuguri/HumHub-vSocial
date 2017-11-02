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
            [
            		'attribute' => 'tokens',
                    'options' => ['style' => 'width:100px;'],
                    'format' => 'raw',
                    'value' => function($data) {
                        return Html::textInput('tokens', $data->tokens, ['id' => 'tokenId','class' => 'form-control', 'readOnly' => true]);
                    },
            ],
            [
                    'header' => Yii::t('AdminModule.views_user_index', 'Actions'),
                    'class' => 'yii\grid\ActionColumn',
                    'options' => ['style' => 'width:80px; min-width:80px;'],
                    'buttons' => [
                        'view' => function($url, $model) {
                            return Html::button('<i class="fa fa-plus"></i>',['id' => 'add', 'class' => 'btn btn-success btn-sm tt']);
                        },
                        'update' => function($model) {
                            return;
                        },
                        'delete' => function($url, $model) {
                            return Html::button('<i class="fa fa-minus"></i>', ['id' => 'subtract', 'class' => 'btn btn-danger btn-sm tt']);
                        }
                    ],
            ],
        ],
    ]);
?>

<script type="text/javascript">
	$('#add').click(function(){
		var old_value = parseInt(document.getElementById('tokenId').value);
		document.getElementById('tokenId').value = parseInt(old_value) + 1;
	});

	$('#subtract').click(function(){
		var old_value = parseInt(document.getElementById('tokenId').value);
		if (old_value <= 0)
		{
			document.getElementById('tokenId').value = 0;	
		}
		else 
		{
			document.getElementById('tokenId').value = old_value - 1;
		}
	});

</script>
