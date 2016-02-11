package account

import "sync"

// Account represents a bank account with a balance and open/closed state.
type Account struct {
	sync.Mutex
	balance int
	closed  bool
}

// Balance returns the Account balance, is unsuccessful if the Account is closed.
func (a *Account) Balance() (int, bool) {
	a.Lock()
	defer a.Unlock()

	return a.balance, !a.closed
}

// Deposit increases the balance by provided amount  and returns the new balance.
// If the provided amount is a negative amount, the balance is reduced by this
// amount. Is unsuccessful if the account is closed or if there is insufficient
// funds to withdraw.
func (a *Account) Deposit(amount int) (int, bool) {
	a.Lock()
	defer a.Unlock()

	if a.closed || a.balance+amount < 0 {
		return 0, false
	}

	a.balance += amount
	return a.balance, true
}

// Close closes the Account and returns the balance of the Account as a payout.
// Is unsuccessful if the Account is already closed.
func (a *Account) Close() (int, bool) {
	a.Lock()
	defer a.Unlock()

	if a.closed {
		return 0, false
	}

	payout := a.balance
	a.balance = 0
	a.closed = true

	return payout, true
}

// Open returns a new Account with the provided amount as the starting balance.
// Returns nil is the amount is negative.
func Open(amount int) *Account {
	if amount < 0 {
		return nil
	}
	return &Account{balance: amount}
}
