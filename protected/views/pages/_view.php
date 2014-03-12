<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id),array('view','id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fb_page_id')); ?>:</b>
	<?php echo CHtml::encode($data->fb_page_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fb_page_name')); ?>:</b>
	<?php echo CHtml::encode($data->fb_page_name); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fb_page_url')); ?>:</b>
	<?php echo CHtml::encode($data->fb_page_url); ?>
	<br />

</div>