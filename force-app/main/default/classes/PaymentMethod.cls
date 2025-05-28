public with sharing virtual class PaymentMethod {

    // Enums to define fixed sets of values
    public enum Status { Draft, Valid, Invalid, Expired, Deleted }
    public enum PaymentMethodType { CreditCard, DebitCard, ACH, PayPal }

    // Static variable to keep track of all payment methods created
    public static Integer totalCreated = 0;

    // Protected instance variables - subclasses can access these
    protected Status paymentMethodStatus;
    protected PaymentMethodType paymentMethodType;

    // Constructor - sets default values
    public PaymentMethod(PaymentMethodType type) {
        this.paymentMethodStatus = Status.Draft;
        this.paymentMethodType = type;
        totalCreated++; // increment static counter
    }

    // Virtual methods - these can be overridden
    public virtual Boolean validatePaymentMethod() {
        return paymentMethodStatus == Status.Valid;
    }

    public virtual Boolean authorizePayment(Decimal amount) {
        return amount > 0;
    }

    public void updateStatus(Status newStatus) {
        Status oldStatus = this.paymentMethodStatus;
        this.paymentMethodStatus = newStatus;
        logStatusChange(oldStatus, newStatus);
    }

    private void logStatusChange(Status oldStatus, Status newStatus) {
        System.debug('Status changed from ' + oldStatus + ' to ' + newStatus);
    }

    // Static method to report the total created
    public static void logTotalCreated() {
        System.debug('Total PaymentMethods created: ' + totalCreated);
    }

    // Inner class represents a related concept
    public class TransactionRecord {
        private Decimal amount;
        private DateTime timestamp;
        private String description;

        public TransactionRecord(Decimal amount, String description) {
            this.amount = amount;
            this.timestamp = DateTime.now();
            this.description = description;
        }

        public String getTransactionDetails() {
            return 'Transaction of $' + amount + ' on ' + timestamp.format() + ': ' + description;
        }
    }
}