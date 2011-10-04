class Dealer < ActiveRecord::Base

  def save_with_consumer_creation
    #for Creating Consumer_Demographics
    self.save
      rto=[]
      min_val=RangeSpecification.last.min_consumer_demographics
      max_val=RangeSpecification.last.max_consumer_demographics
      @consumer_types=ConsumerType.all
      types_count=@consumer_types.count
      sum_all_min=types_count*min_val
      @consumer_types.each_with_index do |consumer_type,index|
        if consumer_type.id==ConsumerType.last.id
          rto[index]=100-rto.sum
        else
          rto[index]=min_val+rand(100-sum_all_min-rto.sum+index*min_val)
        end
        @consumer_demographic=ConsumerDemographic.new
        @consumer_demographic.dealer_id=self.id
        @consumer_demographic.consumer_type_id=consumer_type.id
        @consumer_demographic.ratio=rto[index]
        @consumer_demographic.save
      end
     #for Incentive_Effect_On_Dealers
      rto=[]
      min_val=RangeSpecification.last.min_effect_of_channel_incentive
      max_val=RangeSpecification.last.max_effect_of_channel_incentive
      @channel_incentives=ChannelIncentive.all
      types_count=@channel_incentives.count
      sum_all_min=types_count*min_val
      @channel_incentives.each_with_index do |channel_incentive,index|
      if channel_incentive.id==ChannelIncentive.last.id
        rto[index]=100-rto.sum
      else
        rto[index]=min_val+rand(100-sum_all_min-rto.sum+index*min_val)
      end
      @incentive_effect_on_dealer=IncentiveEffectOnDealer.new
        @incentive_effect_on_dealer.dealer_id=self.id
        @incentive_effect_on_dealer.channel_incentive_id=channel_incentive.id
        @incentive_effect_on_dealer.ratio=rto[index]
        @incentive_effect_on_dealer.save
      end


     #for Consumer Creation
     consumer_catchment.times do |i|

      rto=[]
      flag=false
      while flag!=true
      rto[0]=RangeSpecification.last.min_effect_of_media+rand(1+RangeSpecification.last.max_effect_of_media-RangeSpecification.last.min_effect_of_media)
      rto[1]=RangeSpecification.last.min_effect_of_channel_incentive+rand(1+RangeSpecification.last.max_effect_of_channel_incentive-RangeSpecification.last.min_effect_of_channel_incentive)
      #rto[2]=RangeSpecification.last.min_effect_of_price+rand(1+RangeSpecification.last.max_effect_of_price-RangeSpecification.last.min_effect_of_price)
      rto[2]=100-rto[0]-rto[1]
      if rto[2]>=RangeSpecification.last.min_effect_of_price and rto[2]<=RangeSpecification.last.max_effect_of_price
        flag=true
      end
      end
       @consumer=Consumer.new
       @consumer.dealer_id=self.id
       @consumer.name=IndianName.new.generate_name
       @consumer.consumer_type_id=rand(5)
       @consumer.product_type_id=rand(5)
       @consumer.probability_of_purchase=RangeSpecification.last.min_probability_of_purchase+rand(1+RangeSpecification.last.max_probability_of_purchase-RangeSpecification.last.min_probability_of_purchase)
       @consumer.ratio_of_ad=rto[0]
       @consumer.ratio_of_channel_push=rto[1]
       @consumer.ratio_of_price=rto[2]
       @consumer.save_with_ad_effect_on_consumer
     end

    end
end


