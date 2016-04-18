class Link < ActiveRecord::Base
    acts_as_votable
    belongs_to :user
    has_many :comments, :dependent => :delete_all
    
    def ci_lower_bound(pos, n, confidence)
      if n == 0
          return 0.0
      end
      z = Statistics2.pnormaldist(1-(1-confidence)/2)
      phat = 1.0*pos/n
      ((phat + z*z/(2*n) - z * Math.sqrt((phat*(1-phat)+z*z/(4*n))/n))/(1+z*z/n)*100).round(2)
    end
end
