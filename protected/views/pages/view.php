<?php
$this->breadcrumbs=array(
	'Pages'=>array('index'),
	$model->fb_page_name,
);

$this->menu=array(
	array('label'=>'List Pages','url'=>array('index')),
	array('label'=>'Create Pages','url'=>array('create')),
	array('label'=>'Update Pages','url'=>array('update','id'=>$model->id)),
	array('label'=>'Delete Pages','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Pages','url'=>array('admin')),
);
?>

<h1>View Pages #<?php echo $model->id; ?></h1>

<?php $this->widget('bootstrap.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'fb_page_id',
		'fb_page_name',
		'fb_page_url',
	),
)); ?>
