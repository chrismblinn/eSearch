////////////////////////////////////////////////////////////////////////////////
//
// Delevoped by Robert Scheitlin
//
////////////////////////////////////////////////////////////////////////////////

package widgets.eSearch
{
    import spark.components.gridClasses.GridColumn;
    
    public class eGridColumn extends GridColumn
    {
        private var _NumberFormat:String;
        private var _DateFormat:String;
        private var _CurrencyFormat:String;
        private var _useUTC:Boolean;
        private var _joinedDataColumn:Boolean;
        
        [Bindable]
        public function get joinedDataColumn():Boolean
        {
            return _joinedDataColumn;
        }
        public function set joinedDataColumn(value:Boolean):void
        {
            _joinedDataColumn = value;
            if (value) sortCompareFunction=labelCompareFunction1;
        }
        
        [Bindable]
        public function get useUTC():Boolean
        {
            return _useUTC;
        }
        public function set useUTC(value:Boolean):void
        {
            _useUTC = value;
        }
        
        [Bindable]
        public function get NumberFormat():String
        {
            return _NumberFormat
        }
        public function set NumberFormat(format:String):void
        {
            _NumberFormat = format;
        }
        
        [Bindable]
        public function get CurrencyFormat():String
        {
            return _CurrencyFormat
        }
        public function set CurrencyFormat(format:String):void
        {
            _CurrencyFormat = format;
        }
        
        [Bindable]
        public function get DateFormat():String
        {
            return _DateFormat
        }
        public function set DateFormat(format:String):void
        {
            _DateFormat = format;
        }
        
        public function eGridColumn(columnName:String=null)
        {
            super(columnName);
        }
        
        public function labelCompareFunction1(obj1:Object, obj2:Object, column:GridColumn = null):int
        {  
            var lab1:Object;
            var lab2:Object;
            
            if(labelFunction!=null){    
                lab1 = labelFunction(obj1,this);
                lab2 = labelFunction(obj2,this);
            }
            
            if(is_numeric(lab1) && is_numeric(lab2)){
                var cVal1:Number = Number(lab1);
                var cVal2:Number = Number(lab2);
                if(cVal1<cVal2){
                    return -1;
                }
                if(cVal1 == cVal2){
                    return 0;
                }
                if(cVal1 > cVal2){
                    return 1;
                }
            }else{
                if(lab1 < lab2){
                    return -1;
                }
                if(lab1 == lab2){
                    return 0;
                }
                if(lab1 > lab2){
                    return 1;
                }
            } 
            return 0;
        }
        
        private function is_numeric(val:*):Boolean {
            
            if (!isNaN(Number(val))){
                return true;
            }
            return false;
        }
    }
}