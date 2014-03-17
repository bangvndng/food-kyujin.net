<?php

class QuestionsController extends Controller
{
	/**
	 * @var string the default layout for the views. Defaults to '//layouts/column2', meaning
	 * using two-column layout. See 'protected/views/layouts/column2.php'.
	 */
	public $layout='//layouts/column2';

	/**
	 * @return array action filters
	 */
	public function filters()
	{
		return array(
			'accessControl', // perform access control for CRUD operations
		);
	}

	/**
	 * Specifies the access control rules.
	 * This method is used by the 'accessControl' filter.
	 * @return array access control rules
	 */
	public function accessRules()
	{
		return array(
			array('allow',  // allow all users to perform 'index' and 'view' actions
				'actions'=>array('index','view'),
				'users'=>array('*'),
			),
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array('create','update'),
				'users'=>array('@'),
			),
			array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('admin','delete'),
				'users'=>array('admin'),
			),
			array('deny',  // deny all users
				'users'=>array('*'),
			),
		);
	}

	/**
	 * Displays a particular model.
	 * @param integer $id the ID of the model to be displayed
	 */
	public function actionView($id)
	{
		$attributes = $this->loadModel($id)->attributes;

		$question = Questions::model()->findByPk($id);
		
		$pages = $question->pages;

		Yii::app()->theme = 'yiibootstrap';
		$this->render('view',array(
			'model'=>$this->loadModel($id),
		));
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
		Yii::app()->theme = 'yiibootstrap';
		$model=new Questions;
		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);
		$pages = $model->pages;

		if(isset($_POST['Questions']))
		{
			$model->attributes=$_POST['Questions'];
			if (count($model->permissions) && is_array($model->permissions)) {
				$model->permissions = implode(',', $model->permissions);
			}

			$model->image=CUploadedFile::getInstance($model,'image');

			$model->pages = $_POST['Questions']['pagesIds'];

			if($model->save())
			{
				if (!empty($model->image)) {
					$model->image->saveAs(Yii::app()->basePath.'/../uploads/' .  $model->image->name);
				}	
				$this->redirect(array('view','id'=>$model->id));
			}
		}

		$this->render('create',array(
			'model'=>$model,
		));
	}

	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	public function actionUpdate($id)
	{
		Yii::app()->theme = 'yiibootstrap';
		$model=$this->loadModel($id);

		$pages = $model->pages;

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);
		$model->permissions = explode(',', $model->permissions);
		if(isset($_POST['Questions']))
		{
			// check has upload file
			$isUpload = CUploadedFile::getInstance($model,'image');
			if (!isset($isUpload)) {
				unset($_POST['Questions']['image']);
			}
			else
			{
				$model->image = $isUpload;
			}

			$model->attributes=$_POST['Questions'];

			if (count($model->permissions) && is_array($model->permissions)) {
				$model->permissions = implode(',', $model->permissions);
			}

			$model->pages = $_POST['Questions']['pagesIds'];

			if($model->save())
			{

				if (is_object($model->image)) {
					$model->image->saveAs(Yii::app()->basePath.'/../uploads/' .  $model->image->name);
				}
				$this->redirect(array('view','id'=>$model->id));
			}
		}

		$this->render('update',array(
			'model'=>$model,
			'pages'=>$pages,
		));
	}

	/**
	 * Deletes a particular model.
	 * If deletion is successful, the browser will be redirected to the 'admin' page.
	 * @param integer $id the ID of the model to be deleted
	 */
	public function actionDelete($id)
	{
		Yii::app()->theme = 'yiibootstrap';
		if(Yii::app()->request->isPostRequest)
		{
			// we only allow deletion via POST request
			$this->loadModel($id)->delete();

			// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
			if(!isset($_GET['ajax']))
				$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
		}
		else
			throw new CHttpException(400,'Invalid request. Please do not repeat this request again.');
	}

	/**
	 * Lists all models.
	 */
	public function actionIndex()
	{
		Yii::app()->theme = 'yiibootstrap';
		$dataProvider=new CActiveDataProvider('Questions');
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));
	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		Yii::app()->theme = 'yiibootstrap';
		$model=new Questions('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Questions']))
			$model->attributes=$_GET['Questions'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer the ID of the model to be loaded
	 */
	public function loadModel($id)
	{
		$model=Questions::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param CModel the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='questions-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
}
