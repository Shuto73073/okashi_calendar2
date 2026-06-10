class RecordsController < ApplicationController
  before_action :set_record, only: [ :show, :edit, :update, :destroy ]

  def index
    @records = current_user.records.order(date: :desc)
  end

  def calendar
    @date = params[:start_date] ? Date.parse(params[:start_date]) : Date.today
    @records = current_user.records.where(date: @date.beginning_of_month..@date.end_of_month)
  end


  def show
  end

  def new
  Rails.logger.debug "===== params の中身 ====="
  Rails.logger.debug params.inspect
  Rails.logger.debug "========================="


    @record = current_user.records.new
    if params[:date]
      Rails.logger.debug "date パラメータが存在: #{params[:date]}"
      @record.date = params[:date]
    else
      Rails.logger.debug "date パラメータが存在しない"
    end
  end

  def create
    @record = current_user.records.build(record_params)
    if @record.save
      redirect_to @record, notice: "記録を作成しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @record.update(record_params)
      redirect_to @record, notice: "記録を更新しました", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @record.destroy
    redirect_to records_url, notice: "記録を削除しました"
  end

  private

  def set_record
    @record = current_user.records.find(params[:id])
  end

  def record_params
    params.require(:record).permit(:date, :snack_name, :memo, :amount)
  end
end