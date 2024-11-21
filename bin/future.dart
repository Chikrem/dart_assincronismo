void main() {
    
    Future myFuture = Future((){
        print('Going back to the Future');
        return 21;
    });
    
    print('Done with main');
}