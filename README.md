# Whale Transfer Trap  

A **Drosera test trap** that detects if someone transfers more than X% of a token’s total supply in a single transaction.  

---

### How it works  
- Implements `collect(..)` and `shouldRespond(..)` as required for Drosera traps.  
- Emits an event `WhaleTransferDetected` when a whale-sized transfer happens.  
- Built with **test tokens** (not for production security use).  

---

### How to use  
1. Deploy the smart contract `WhaleTransferTrap.sol` with your chosen threshold percentage (e.g. 5 for 5%).  
2. Connect the trap to Drosera via your TOML config under `[traps]`.  
3. When a transfer exceeds the threshold % of total supply, the trap will emit a `WhaleTransferDetected` event.  
4. Monitor emitted events to respond to whale-sized token movements.  

---

### Notes  
- This trap is for **testing purposes only**.  
- Do not use with production assets.  
