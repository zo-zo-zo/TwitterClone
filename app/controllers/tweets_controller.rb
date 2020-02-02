class TweetsController < ApplicationController
before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  def index
    @tweets = Tweet.all
  end


  def edit
  end

  def update

    if @tweet.update(tweet_params)
        redirect_to tweets_path, notice: "whisperを編集しました！"
    else
        render :edit
    end
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if params[:back]
      render :new
    else
      if @tweet.save
        redirect_to tweets_path, notice: "whisperを作成しました！"
      else
        render 'new'
      end
    end
  end

  def show
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice:"whisperを削除しました！"
  end

  def confirm
    @tweet = Tweet.new(tweet_params)
    render :new if @tweet.invalid?
  end

  private

  def tweet_params
    params.require(:tweet).permit(:title, :content)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

end
