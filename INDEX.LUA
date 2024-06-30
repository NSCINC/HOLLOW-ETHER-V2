-- SPDX-License-Identifier: MIT

-- InvestmentContract
local InvestmentContract = {}
InvestmentContract.__index = InvestmentContract

function InvestmentContract.new()
    local self = setmetatable({}, InvestmentContract)
    self.owner = nil
    self.balances = {}
    self.investedAmount = {}
    self.authorizedInvestors = {}
    return self
end

function InvestmentContract:invest(amount)
    assert(self.authorizedInvestors[msg.sender], "Investor is not authorized")
    assert(amount > 0, "Investment amount must be greater than zero")
    assert(amount <= self.balances[msg.sender], "Insufficient balance")

    self.balances[msg.sender] = self.balances[msg.sender] - amount
    self.investedAmount[msg.sender] = self.investedAmount[msg.sender] + amount

    emit(Investment, msg.sender, amount)
end

function InvestmentContract:authorizeInvestor(investor, authorized)
    assert(msg.sender == self.owner, "Only owner can perform this action")
    self.authorizedInvestors[investor] = authorized
    emit(AuthorizationChanged, investor, authorized)
end

function InvestmentContract:balanceOf(investor)
    return self.balances[investor] or 0
end

function InvestmentContract:investedAmountOf(investor)
    return self.investedAmount[investor] or 0
end

-- AuthenticationContract
local AuthenticationContract = {}
AuthenticationContract.__index = AuthenticationContract

function AuthenticationContract.new()
    local self = setmetatable({}, AuthenticationContract)
    self.owner = nil
    self.messageAuthenticity = {}
    return self
end

function AuthenticationContract:authenticateMessage(messageHash)
    assert(self.messageAuthenticity[msg.sender][messageHash] == false, "Message already authenticated")
    self.messageAuthenticity[msg.sender][messageHash] = true
    emit(MessageAuthenticated, msg.sender, messageHash, true)
end

function AuthenticationContract:isMessageAuthenticated(investor, messageHash)
    return self.messageAuthenticity[investor][messageHash] or false
end
