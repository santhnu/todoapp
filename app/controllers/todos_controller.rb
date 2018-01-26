class TodosController < ApplicationController
   
   def new
     @todo = Todo.new
   end
  
   def create
      #Strong Parameters introduced in Rails 4
      #PARAMS Hash is received by our application(info from the web passes thru the URL). Inorder for us to use that Hash we need to whitelist what the appication can receive - stromg parameters 
      @todo = Todo.new(todo_params)  
      
      if @todo.save
         flash[:notice] = "Todo was created successfully"
         #redirect_to todo_path(@todo) #we can pass the object having the parameter
         redirect_to todo_path(@todo.id) #or we can pass the specific attribute of the object
      else
         #render 'xxx' - will NOT clear the form/page (text that we typed in)
         render 'new'
         #redirect_to ROUTEPATH - will clear the form/page (text that we typed in)
         #redirect_to new_todo_path
      end
       #Todo.where('id > ? and id < ?',5,12)  
   end
   
   def show
      #@todo1 = @todo.find(params[:id])
      @todo = Todo.find(params[:id])
   end
   
   #Whitelisting Method
   private #Method is only available in this particular controller - TodoController
      def todo_params
         params.require(:todo).permit(:name, :description)
      end
   
end
