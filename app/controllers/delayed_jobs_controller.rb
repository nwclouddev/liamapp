class DelayedJobsController < ApplicationController

def index
  @delayed_jobs = DelayedJob.all.order(:created_at)
end

end
