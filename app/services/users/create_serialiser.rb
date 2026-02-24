module Users
    class CreateSerialiser
      def initialize(params)
        @params = params
      end

      def call
        return create
      end

      private

      def create
         users = User.create(@params)
      end
    end
end