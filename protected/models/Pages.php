<?php

/**
 * This is the model class for table "apps".
 *
 * The followings are the available columns in table 'apps':
 * @property string $id
 * @property string $name
 * @property string $fb_app_id
 * @property string $fb_app_key
 *
 * The followings are the available model relations:
 * @property Questions[] $questions
 */
class Pages extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'pages';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('fb_page_id, fb_page_name,fb_page_url', 'length', 'max'=>255),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, fb_page_id, fb_page_name, fb_page_url', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'questions'=>array(self::MANY_MANY, 'Questions','questions_pages(page_id, question_id)',),
		);
	}
	

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'fb_page_id' => 'Fb Page ID',
			'fb_page_name' => 'Fb Page Name',
			'fb_page_url' => 'Fb Page URL',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id,true);
		$criteria->compare('fb_page_id',$this->fb_page_id,true);
		$criteria->compare('fb_page_name',$this->fb_page_name,true);
		$criteria->compare('fb_page_url',$this->fb_page_url,true);
		
		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Apps the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
