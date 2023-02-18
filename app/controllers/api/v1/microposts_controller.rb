module Api
    module V1
        class MicropostsController < ApiController
        def index
            @microposts = current_user.feed.paginate(page: params[:page])
        end
        end
    end
end