class Round < ActiveRecord::Base

    attr_accessible :name,:case_study_id,:round_expenses_attributes,:macro_indicator_for_rounds_attributes,:hr_incentive_for_rounds_attributes,:channel_incentive_for_rounds_attributes,:media_for_rounds_attributes
    belongs_to :case_study

    has_many :macro_indicator_for_rounds ,:dependent =>:destroy
    has_many :macro_indicator_options, :through => :macro_indicator_for_rounds

    has_many :round_expenses, :dependent => :destroy
    has_many :expenses, :through => :round_expenses

    has_many :hr_incentive_for_rounds,:dependent => :destroy
    has_many :hr_incentives,:through=>:hr_incentive_for_rounds

    has_many :channel_incentive_for_rounds,:dependent => :destroy
    has_many :channel_incentives,:through=>:channel_incentive_for_rounds

    has_many :media_for_rounds,:dependent => :destroy
    has_many :mediums,:through=>:media_for_rounds

    accepts_nested_attributes_for :round_expenses, :reject_if => lambda {|a| a[:expense_id].to_i ==0}
    accepts_nested_attributes_for :hr_incentive_for_rounds, :reject_if => lambda {|a| a[:hr_incentive_id].to_i ==0}
    accepts_nested_attributes_for :channel_incentive_for_rounds, :reject_if => lambda {|a| a[:channel_incentive_id].to_i ==0}
    accepts_nested_attributes_for :media_for_rounds, :reject_if => lambda {|a| a[:medium_id].to_i ==0}
    accepts_nested_attributes_for :macro_indicator_for_rounds, :reject_if => lambda {|b| b[:macro_indicator_option_id].to_i ==0}


end
